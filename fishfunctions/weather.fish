function weather -d "Get weather at location"
    if count $argv > /dev/null
        echo No args
    else
        echo $argv[1]
    end
end
