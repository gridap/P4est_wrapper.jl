using Documenter, P4est_wrapper

makedocs(;
    modules=[P4est_wrapper],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/gridap/P4est_wrapper.jl/blob/{commit}{path}#L{line}",
    sitename="P4est_wrapper.jl",
    authors="Víctor Sande <vsande@cimne.upc.edu>, Large Scale Scientific Computing",
    assets=String[],
)

deploydocs(;
    repo="github.com/gridap/P4est_wrapper.jl",
)
