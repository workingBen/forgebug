namespace :hb do
  fresh_start = false

  desc 'Test: build, start emulator, run'
  task :test => [:build, :start_emulator, :run_emulator]
  desc 'Package: build, package, run'
  task :package => [:build, :forge_package, :run_device]

  desc 'Build the hb client'
  task :build do
    `cd forge; forge build`
  end

  desc 'Package the hb client'
  task :forge_package do
    puts "KILLING old releases"
    `rm ./forge/release/android/*.apk`
    `cd forge; forge package android; open ./release/android`
  end

  desc 'Emulate the hb client'
  task :start_emulator do
    fresh_start = system "sh start_emulator.sh"
    puts fresh_start ? "Starting android emulator" : "Android emulator already running."
  end
  
  desc 'Run the hb client'
  task :run_emulator do
    if fresh_start
      puts "Just fired up Emulator, waiting for it to start."
      sleep(30)
      puts "Done waiting for emulator."
      fresh_start = false
    end

    puts "Running app"
    system `cd forge; forge run android`
  end

  desc 'Install and run the HB client on a device'
  task :run_device do
    device_attached = system "adb devices | grep device$"
    if device_attached
      puts "Your device is attached. Installing .apk now!"
      apk = `cd forge/release/android; ls -lrt | awk '{ f=$NF }; END{ print f }'`
      system "cd forge/release/android; adb install -r #{apk}"
    else
      puts "No device is attached. STOPPING."
    end
  end
end

task :test do
  apk = `cd forge/release/android;  ls -lrt | awk '{ f=$NF }; END{ print f }'`
  puts apk
end
