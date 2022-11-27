project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
		
    targetdir 	("%{wks.location}/bin/%{prj.name}/" .. outputDir)
    objdir 		("%{wks.location}/obj/%{prj.name}/" .. outputDir)

    files 
    { 
        "include/spdlog/**.h",
        "src/**.cpp"
    }
	
	includedirs
	{
		"include"
	}
	
	defines
	{
		"SPDLOG_COMPILED_LIB",
	}

    filter "system:windows"
        systemversion "latest"
        
	filter "system:linux"
		pic "On"
		systemversion "latest"
      
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"