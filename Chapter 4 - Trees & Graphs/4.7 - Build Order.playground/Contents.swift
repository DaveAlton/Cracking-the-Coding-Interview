// You are given a list of projects and a list of dependencies (which is a list of 
// pairs of projects, where the second project is dependent on the first project). 
// All of a project's dependencies must be built before the project is. 
// Find a build order that will allow the projects to be built. 
// If there is no valid build order, return an error.
//
// EXAMPLE
// Input:
//     projects: a, b, c, d, e, f
//     dependencies: (a, d), (f, b), (b, d), (f, a), (d, c)
// Output: f, e, a, b, d, c

// VISUALIZATION (nodes below mean they are dependencies)
//          F
//         / \
//        A   B
//         \ /     E
//          D
//          |
//          C
// Once I have built this graph, I can traverse through it depth first and add them in reverse to an array. 
// In that case, the link between B and D won't be necessary because we can assume D will be built before B because it was built for A.
// [c,d,a,b,f,e] (I don't know why the example is building F before B or A, seeing that F is dependent on both B and A)

class GraphNode: Equatable {
    var value: String
    var nodes: [GraphNode]
    init(value: String, nodes: [GraphNode] = []) {
        self.value = value
        self.nodes = nodes
    }
    
    static func ==(lhs: GraphNode, rhs: GraphNode) -> Bool {
        return Unmanaged<AnyObject>.passUnretained(lhs as AnyObject).toOpaque() == Unmanaged<AnyObject>.passUnretained(rhs as AnyObject).toOpaque()
    }
}

func buildOrder(projects: [String], dependencies: [(project: String, dependency: String)]) -> [String] {
    // Returns a bool if successful
    func addNode(_ node: GraphNode, to graph: GraphNode, at point: String) -> Bool {
        if graph.value == point {
            graph.nodes.append(node)
            return true
        } else {
            for subNode in graph.nodes {
                if addNode(node, to: subNode, at: point) {
                    return true
                }
            }
        }
        return false
    }
    // Keep track, in O(1) time, of the projects that will be built using dependencies
    var dependencyProjects = [String: Bool]()
    // Keep track of where each graph starts
    var graphStarts = [GraphNode]()
    for dependencyPair in dependencies {
        // Mark each project as a dependency project
        dependencyProjects[dependencyPair.project] = true
        dependencyProjects[dependencyPair.dependency] = true
        // Add each project and its dependency to the graph starts
        var addedToGraphStarts = false
        for graph in graphStarts {
            if addNode(GraphNode(value: dependencyPair.dependency), to: graph, at: dependencyPair.project) {
                addedToGraphStarts = true
            }
        }
        if !addedToGraphStarts {
            graphStarts.append(GraphNode(value: dependencyPair.project, nodes: [GraphNode(value: dependencyPair.dependency)]))
        }
        // Merge graph starts if possible
        for graph in graphStarts {
            for otherGraph in graphStarts {
                if graph != otherGraph {
                    if addNode(graph, to: otherGraph, at: graph.value) {
                        graphStarts.remove(at: graphStarts.index(of: graph)!)
                    }
                }
            }
        }
    }
    // Depth first search on graph starts, adding them in order to a returnable array
    var buildOrder = [String]()
    func subNodes(of graph: GraphNode) -> [String] {
        guard graph.nodes.count > 0 else { return [graph.value] }
        var subnodes = [String]()
        for subnode in graph.nodes {
            subnodes.append(contentsOf: subNodes(of: subnode))
        }
        subnodes.append(graph.value)
        return subnodes
    }
    for graph in graphStarts {
        buildOrder.append(contentsOf: subNodes(of: graph))
    }
    // Add projects that have no dependencies
    for project in projects {
        if dependencyProjects[project] != true {
            buildOrder.append(project)
        }
    }
    // Remove duplicates, keeping the first instances, but not the latter
    var uniqueBuildOrder = [String]()
    for project in buildOrder {
        if !uniqueBuildOrder.contains(project) {
            uniqueBuildOrder.append(project)
        }
    }
    return uniqueBuildOrder
}

//    A
//   / \
//  B   C
//  B,C,A
buildOrder(projects: ["a", "b", "c"], dependencies: [(project: "a", dependency: "b"), (project: "a", dependency: "c")])

//  A   C
//   \ /
//    B
//  B,A,C
buildOrder(projects: ["a", "b", "c"], dependencies: [(project: "a", dependency: "b"), (project: "c", dependency: "b")])

//    A
//    |
//    B
//    |
//    C
//  C,B,A
buildOrder(projects: ["a", "b", "c"], dependencies: [(project: "a", dependency: "b"), (project: "b", dependency: "c")])

//        F
//       / \
//      A   B
//       \ /     E
//        D
//        |
//        C
//  C,D,B,A,F,E
buildOrder(projects: ["a", "b", "c", "d", "e", "f"],
           dependencies:
    [
            (project: "a", dependency: "d"),
            (project: "f", dependency: "b"),
            (project: "b", dependency: "d"),
            (project: "f", dependency: "a"),
            (project: "d", dependency: "c")
    ]
)
