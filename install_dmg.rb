    #!/usr/bin/env ruby

    require 'fileutils'
    require 'pathname'
    include FileUtils

    #go to downloads directory
    puts "installing most recent .dmg"
    cd File.expand_path("~/Downloads/")
    path = Pathname.new('.')

    #find most recent .dmg file
    files = path.entries.collect { |file| path+file }.sort { |file1,file2| file1.ctime <=> file2.ctime }
    files.reject! { |file| ((file.file? and file.to_s.include?(".dmg")) ? false : true) }
    last_dmg = files.last

    #if there is no .dmg file then reject this.
    if !last_dmg
      puts "No DMG files" 
      exit
    end

    puts "Mounting #{last_dmg}"

    mount_point = Pathname.new "/Volumes/#{last_dmg}"

    result = `hdiutil attach -mountpoint #{mount_point}  #{last_dmg}`

    #find any apps in the mounted dmg
    files = mount_point.entries.collect { |file| mount_point+file }
    files.reject! { |file| ((file.to_s.include?(".app")) ? false : true) }

    files.each { |app| 
      puts "Copying #{app} to Applications folder"
      `cp -a #{app} /Applications/` 
    }

    #unmount the .dmg
    puts "Unmounting #{last_dmg}"
    result = `hdiutil detach #{mount_point}`
    puts "Finished installing #{last_dmg}"


    #delete the .dmg
    rm last_dmg 