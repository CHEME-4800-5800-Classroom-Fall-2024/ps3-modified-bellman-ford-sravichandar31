abstract type MyAbstractGraphModel end
abstract type MyAbstractGraphNodeModel end
abstract type MyAbstractGraphEdgeModel end
abstract type MyAbstractGraphSearchAlgorithm end

"""
  mutable struct MyGraphNodeModel <: MyAbstractGraphNodeModel

The struct represents a node in a graph model.

### Fields
- `id::Int64`: the unique identifier of the node. We'll use the index of the node in the graph model.
- `capacity::Union{Nothing, Tuple{Int64, Int64}}`: the maximum in-degree and out-degree of the node.
"""
mutable struct MyGraphNodeModel <: MyAbstractGraphNodeModel
   
  # data -
  id::Int64
  capacity::Union{Nothing, Tuple{Int64, Int64}}; # node capacity {MaxInDegree, MaxOutDegree}
 
  # constructor -
  MyGraphNodeModel(id::Int64, capacity::Union{Nothing, Int64}) = new(id, capacity);
end
 
"""
  mutable struct MyGraphEdgeModel <: MyAbstractGraphEdgeModel

The struct represents an edge in a graph model.

### Fields
- `id::Int64`: the unique identifier of the edge. We'll use the index of the edge in the graph model.
- `source::Int64`: the source node id.
- `target::Int64`: the target node id.
- `cost::Union{Nothing, Float64}`: the cost of the edge.
- `lower_bound_capacity::Union{Nothing, Float64}`: the lower bound capacity of the edge.
- `upper_bound_capacity::Union{Nothing, Float64}`: the upper bound capacity of the edge.

"""
mutable struct MyGraphEdgeModel <: MyAbstractGraphEdgeModel
    
   # data -
   id::Int64
   source::Int64
   target::Int64
   cost::Union{Nothing, Float64}; # this is a little fancy??
   lower_bound_capacity::Union{Nothing, Float64}; # this is a little fancy??
   upper_bound_capacity::Union{Nothing, Float64}; # this is a little fancy??
 
   # constructor -
   MyGraphEdgeModel() = new();
end
 
"""
  mutable struct MySimpleDirectedGraphModel <: MyAbstractGraphModel

The struct represents a simple directed graph model.

### Fields
- `nodes::Union{Nothing, Dict{Int64, MyGraphNodeModel}}`: a dictionary of node models. Keys are node ids, and values are `MyGraphNodeModel` instances.
- `edges::Union{Nothing, Dict{Tuple{Int, Int}, Tuple{Float64, Float64, Float64}}}`: a dictionary of edge models. Keys are edge ids, and values are tuples of the cost, lower bound capacity, and upper bound capacity of the edge.
- `edgesinverse::Dict{Int, Tuple{Int, Int}}`: a map between edge id and source and target.
- `children::Union{Nothing, Dict{Int64, Set{Int64}}}`: a dictionary of children nodes. Keys are node ids, and values are sets of children node ids.
- `A::Array{Float64,2}`: the system constraint matrix for flow optimization. Rows are nodes, and columns are edges.

"""
mutable struct MySimpleDirectedGraphModel <: MyAbstractGraphModel
    
   # data -
   nodes::Union{Nothing, Dict{Int64, MyGraphNodeModel}}
   edges::Union{Nothing, Dict{Tuple{Int, Int}, Tuple{Float64, Float64, Float64}}}; # first Float64 is the cost, second Float64 is the capacity
   edgesinverse::Dict{Int, Tuple{Int, Int}} # map between edge id and source and target
   children::Union{Nothing, Dict{Int64, Set{Int64}}}
   A::Array{Float64,2}; # system constraint matrix for flow optimization
 
   # constructor -
   MySimpleDirectedGraphModel() = new();
end

"""
  struct DikjstraAlgorithm <: MyAbstractGraphSearchAlgorithm

The struct represents the Dikjstra algorithm for graph search. No data is stored in the struct.
"""
struct DikjstraAlgorithm <: MyAbstractGraphSearchAlgorithm
   DikjstraAlgorithm() = new();
end

"""
  struct BellmanFordAlgorithm <: MyAbstractGraphSearchAlgorithm

The struct represents the Bellman Ford algorithm for graph search. No data is stored in the struct.
"""
struct BellmanFordAlgorithm <: MyAbstractGraphSearchAlgorithm
   BellmanFordAlgorithm() = new();
end

"""
  struct ModifiedBellmanFordAlgorithm <: MyAbstractGraphSearchAlgorithm

The struct represents the Modified Bellman Ford algorithm for graph search. No data is stored in the struct.
"""
struct ModifiedBellmanFordAlgorithm <: MyAbstractGraphSearchAlgorithm
  ModifiedBellmanFordAlgorithm() = new();
end