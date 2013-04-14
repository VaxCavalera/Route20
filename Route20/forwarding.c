/* forwarding.c: DECnet Forwarding Process (section 4.9)
  ------------------------------------------------------------------------------

   Copyright (c) 2012, Robert M. A. Jarratt
 
   Permission is hereby granted, free of charge, to any person obtaining a
   copy of this software and associated documentation files (the "Software"),
   to deal in the Software without restriction, including without limitation
   the rights to use, copy, modify, merge, publish, distribute, sublicense,
   and/or sell copies of the Software, and to permit persons to whom the
   Software is furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
   THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

   Except as contained in this notice, the name of the author shall not be
   used in advertising or otherwise to promote the sale, use or other dealings
   in this Software without prior written authorization from the author.

  ------------------------------------------------------------------------------*/

#include <memory.h>
#include "packet.h"
#include "messages.h"
#include "platform.h"
#include "forwarding_database.h"
#include "area_routing_database.h"
#include "area_forwarding_database.h"
#include "adjacency.h"
#include "forwarding.h"

static adjacency_t *GetAdjacencyForNode(decnet_address_t *node);

int IsReachable(decnet_address_t *address)
{
	int ans = 0;

	if (nodeInfo.address.area != address->area)
	{
		ans = nodeInfo.level == 1 || IsAreaReachable(address->area);
	}
	else
	{
		ans = IsNodeReachable(address->node);
	}

	return ans;
}

void ForwardPacket(packet_t *packet)
{
	adjacency_t *srcAdjacency;
    decnet_address_t srcNode;
	decnet_address_t dstNode;
	packet_t *packetToForward;
	byte forwardFlags = 0x0E;
	byte flags;
	int visits;
	byte *data;
	int dataLength;
	int forward = 1;

	ExtractDataPacketData(packet, &srcNode, &dstNode, &flags, &visits, &data, &dataLength);
	Log(LogForwarding, LogVerbose, "Forward from ");
	LogDecnetAddress(LogForwarding, LogVerbose, &srcNode);
	Log(LogForwarding, LogVerbose, " to ");
	LogDecnetAddress(LogForwarding, LogVerbose, &dstNode);
	Log(LogForwarding, LogVerbose, ". Visits=%d", visits);
	Log(LogForwarding, LogVerbose, " OA(0)=%d, AOA(area)=%d, Att=%d, Reachable=%d.", OA[0], AOA[dstNode.area], AttachedFlg, IsReachable(&dstNode));

	visits++;

	srcAdjacency = GetAdjacencyForNode(&packet->from);
	if (srcAdjacency != NULL)
	{
		if (srcAdjacency->type == PhaseIIIAdjacency)
		{
			Log(LogForwarding, LogWarning, "TODO: Phase III data packet forwarding not implemented\n");
			forward = 0;
		}

		if (srcNode.area == 0)
		{
			srcNode.area = nodeInfo.address.area;
		}

		if (dstNode.area == 0)
		{
			dstNode.area = nodeInfo.address.area;
		}

		if (IsReturnToSender(flags))
		{
			forwardFlags = 0x16;
			if (visits > 2 * Maxv)
			{
				Log(LogForwarding, LogWarning, "Dropping looping return message\n");
				forward = 0;
			}
		}

		if (!IsReachable(&dstNode))
		{
			if (IsReturnToSenderRequest(flags))
			{
				decnet_address_t temp;
				memcpy(&temp, &srcNode, sizeof(decnet_address_t));
				memcpy(&srcNode, &dstNode, sizeof(decnet_address_t));
				memcpy(&dstNode, &temp, sizeof(decnet_address_t));
				Log(LogForwarding, LogVerbose, "Returning packet to sender as node unreachable\n");
				forwardFlags = 0x16;
			}
			else
			{
				Log(LogForwarding, LogVerbose, "Dropping packet to unreachable node because return not requested\n");
				forward = 0;
			}
		}
		else if (visits > Maxv)
		{
			Log(LogForwarding, LogWarning, "Dropping looping message\n");
			forward = 0;
		}

		if (forward)
		{
			packetToForward = CreateLongDataMessage(&srcNode, &dstNode, forwardFlags, visits, data, dataLength);
			SendPacket(&dstNode, packetToForward, flags);
		}
	}
	else
	{
		Log(LogForwarding, LogWarning, "Source adjacency not found.\n");
	}
}

void SendPacket(decnet_address_t *dstNode, packet_t *packet, byte flags)
{
    adjacency_t *dstAdjacency;
	int forward = 1;

	dstAdjacency = GetAdjacencyForNode(dstNode);

	if (dstAdjacency != NULL)
	{
		if (dstAdjacency->type == PhaseIIIAdjacency)
		{
			Log(LogForwarding, LogWarning, "TODO: Phase III data packet forwarding not implemented\n");
			forward = 0;
		}

		if (forward)
		{

			if (IsBroadcastCircuit(dstAdjacency->circuit))
			{
				flags = SetIntraEthernet(flags);
			}
			else
			{
				flags = ClearIntraEthernet(flags);
			}

			Log(LogForwarding, LogVerbose, "Forwarding to %s\n", dstAdjacency->circuit->name);
			dstAdjacency->circuit->WritePacket(dstAdjacency->circuit, &nodeInfo.address, &dstAdjacency->id, packet);
		}
	}
	else
	{
		Log(LogForwarding, LogWarning, "Destination adjacency not found.\n");
	}
}

static adjacency_t *GetAdjacencyForNode(decnet_address_t *node)
{
	int adjacencyNum = 0;
	adjacency_t *ans;

	if (node->area == nodeInfo.address.area)
	{
		adjacencyNum = OA[node->node];
	}
	else if (node->area != nodeInfo.address.area && (nodeInfo.level == 1 || (nodeInfo.level == 2 && !AttachedFlg)))
	{
		adjacencyNum = OA[0];
	}
	else if (node->area != nodeInfo.address.area && nodeInfo.level == 2 && AttachedFlg)
	{
		adjacencyNum = AOA[node->area];
	}

	if (adjacencyNum == 0)
	{
		ans = FindAdjacency(node);
	}
	else
	{
		ans = GetAdjacency(adjacencyNum);
	}

	return ans;
}
