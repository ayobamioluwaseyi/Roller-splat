Shader "Custom/Gradient"
{
    //05 gradient
    Properties
    {
        _TopColor ("TopColor", Color) = (1,1,1,1)
        _ButtomColor( "BottomColor", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderTYpe" = "Opaque" }
        LOD 200

        CGPROGRAM
        // physically based starndard lighting model, and shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        
        // use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
            float4 screenPos;
        };
        fixed4 _TopColor;
        fixed4 _ButtomColor;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 screenUV = (IN.screenPos.xy / IN.screenPos.w);
            screenUV.y = 1-screenUV.y;
            fixed4 color = lerp(_TopColor, _ButtomColor, screenUV.y);
            o.Albedo = color.rgb;
            o.Alpha = color.a;
        }
        ENDCG

    }
    FallBack "Diffuse"
    //end 05 gradient
}