function cppnew -d "Create new C++ project"
    cp -r ~/dotfiles/dev/templateC++ $argv[1]
    cd $argv[1]
    sed -i "s/PROJECTNAME/$argv[1]/g" CMakeLists.txt
    sed -i "s/PROJECTNAME/$argv[1]/g" README.org
    sed -i "s/CPPPROJECTNAME/$argv[1]/g" doc/Doxyfile
    git init
    git add .
    git commit -m "initial commit"
    cd ..
end
