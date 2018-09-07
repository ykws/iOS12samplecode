//
//  Sigmoid.metal
//  RecChar
//
//  Created by sonson on 2018/09/06.
//  Copyright © 2018年 sonson. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void sigmoid(texture2d_array<half, access::read> inTexture [[texture(0)]], texture2d_array<half, access::write> outTexture [[texture(1)]], ushort3 gid [[thread_position_in_grid]]) {
    if (gid.x >= outTexture.get_width() || gid.y >= outTexture.get_height()) {
        return;
    }
    const float4 x = float4(inTexture.read(gid.xy, gid.z));
    const float4 y = 1 / (1.0f + exp(-x));
    outTexture.write(half4(y), gid.xy, gid.z);
}
