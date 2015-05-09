if exist njpipesC.jar (
    if exist njpipesC.old del njpipesC.old
    ren njpipesC.jar njpipesC.old
)
jar cvf njpipesC.jar -C build/ .
