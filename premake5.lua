project "GLFW"       -- GLFW 프로젝트
    kind "StaticLib" -- 정적라이브러리 lib
    language "C"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files -- 플랫폼 독립 파일들
	{
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }

	filter "system:windows"
	systemversion "latest"

        	files -- 윈도우 플랫폼 의존(종속) 파일들
        	{
            		"src/win32_init.c",
            		"src/win32_joystick.c",
            		"src/win32_monitor.c",
            		"src/win32_time.c",
            		"src/win32_thread.c",
            		"src/win32_window.c",
            		"src/wgl_context.c",
            		"src/egl_context.c",
            		"src/osmesa_context.c"
        	}

		defines -- 윈도우 플랫폼 의존(종속) 전처리기 정의
		{ 
            		"_GLFW_WIN32",
            		"_CRT_SECURE_NO_WARNINGS"
		}

 filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
