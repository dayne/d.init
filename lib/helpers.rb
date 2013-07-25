require 'colored'
require 'highline/import'

def boom(msg=nil)
  puts "## BOOM ## : #{msg}" if msg
  exit 1 
end

def yak(msg=nil)
  puts "#"*79
  puts msg if msg
end

def ubuntu?
  if File.exists?('/etc/issue.net')
    return File.open('/etc/issue.net').grep(/Ubuntu/).length > 0
  else 
    return false
  end
end

def run(cmd)
  puts "running: " + "#{cmd}".green
  sleep 0.5
  system(cmd) unless $TEST
end

def got_command?(cmd)
  system("which #{cmd} > /dev/null")
end

def install(cmd)
  if ubuntu?
    if system("dpkg -l #{cmd} > /dev/null 2>&1")
      yak("appear to already have #{cmd} ... skipping")
    else
      return run("sudo apt-get install #{cmd}")
    end
  else
    boom "install() not available outside of Ubuntu"
  end
end
