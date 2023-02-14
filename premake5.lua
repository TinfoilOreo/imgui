project "ImGui"
        kind "StaticLib"
        language "C++"
        
        targetdir "bin/%{cfg.buildcfg}"
        objdir "bin-int/%{cfg.buildcfg}"
    
        defines { "IMGUI_IMPL_OPENGL_LOADER_GLAD" }
    
        includedirs {
            "%{IncludeDir.ImGui}",
            "backends",
            "%{IncludeDir.GLFW}",
            "%{IncludeDir.Glad}",
            "%{IncludeDir.VulkanSDK}"
        }
        
        files {
            "imconfig.h",
            "imgui.h",
            "imgui.cpp",
            "imgui_draw.cpp",
            "imgui_internal.h",
            "imgui_widgets.cpp",
            "imgui_tables.cpp",
            "imstb_rectpack.h",
            "imstb_textedit.h",
            "imstb_truetype.h",
            "imgui_demo.cpp",
            "backends/imgui_impl_opengl3.h",
            "backends/imgui_impl_opengl3.cpp",
            "backends/imgui_impl_vulkan.h",
            "backends/imgui_impl_vulkan.cpp"
        }
        
        links {
            "GLFW"
        }
    
        filter "system:windows"
            systemversion "latest"
            cppdialect "C++17"
            staticruntime "On"
    
            files {
                "backends/imgui_impl_win32.h",
                "backends/imgui_impl_win32.cpp",
                "backends/imgui_impl_glfw.h",
                "backends/imgui_impl_glfw.cpp"
            }

            links {
              "%{VULKAN_SDK}/Lib/vulkan-1.lib"
            }
        
        filter "system:linux"
            pic "On"
            systemversion "latest"
            cppdialect "C++17"
            staticruntime "On"
    
            files {
                "backends/imgui_impl_glfw.h",
                "backends/imgui_impl_glfw.cpp"
            }
        
        filter "configurations:Debug"
            runtime "Debug"
            symbols "On"
        
        filter "configurations:Release"
            runtime "Release"
            optimize "On"
