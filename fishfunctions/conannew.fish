function conannew -d "Create new C++ project with Conan and Ninja"
    cp -r ~/dotfiles/dev/conan-project $argv[1]
    cd $argv[1]
    sed -i "s/PROJECTNAME/$argv[1]/g" README.org
    sed -i "s/PROJECTNAME/$argv[1]/g" CMakeLists.txt
    git init
    git add .
    git commit -m "initial commit"
    cd ..
end
