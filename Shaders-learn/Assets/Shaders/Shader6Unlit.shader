Shader "YavuzsShaders/Shader6Unlit"
{
    Properties
    {
       
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
// Upgrade NOTE: excluded shader from DX11; has structs without semantics (struct v2f members position)
//#pragma exclude_renderers d3d11
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            
           

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 position: TEXCOORD1;
                float2 uv : TEXCOORD0;
            };
            
            v2f vert (appdata_base v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.position = v.vertex;
                o.uv = v.texcoord;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed3 color =  i.position*2;

                fixed2 pos = (1,1)-length(i.position.xy*2);
                pos.r = step(0, pos.r);
                pos.g = step(0, pos.g);
                color = (pos, 0);
                
               
              // color.r=smoothstep(0.5,0.01,color.r);
               //color.g=smoothstep(0.5,0.1,color.g);
              // color.r=smoothstep(0,1,color.r);
               //color.g=smoothstep(0,.1,color.g);
              // color.g=(0,color.g);
               //fixed2 pos=length(i.position.xy);
               //color = (pos,0);
               // color.r=.1;
              // fixed3 color=(0,0,0);
              // color.r=1;
              // color.b=1;
                return fixed4(pos,0, 1.0);
            }
            ENDCG
        }
    }
}
