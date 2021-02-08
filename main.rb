require 'open-uri'

puts 'Ruby wita!'

open('main.kt', 'w') do |file|
    file << open('https://kumpelstachu.github.io/witam/main.kt').read
end

if not system 'which kotlinc > /dev/null'
    system 'sudo snap install --classic kotlin > /dev/null'
end

system 'kotlinc main.kt -include-runtime -d main.jar > /dev/null'
system 'kotlin main.jar'