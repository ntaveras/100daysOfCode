public interface Tree{
    //If an invalid position is sent as a parameter to any method of a tree, then an IllegalArgumentException is thrown.
    
    Position getRoot(); // Get the root node for the tree
    
    Position getParent(Position node); // Return parent node
    
    List<Position> getChild(Position node); // Return list of child nodes
    
    Integer numChildren(Position node); // Retu
    
    Boolean isEdge(Position node);
    
    Boolean isLeaf(Position node); // 
    
    Boolean isRoot(Position node);
    
    Integer size();
    
    Boolean isEmpty();
    
    List<Object> getDataIterator();
    
    List<Position> getTreeNodes();

}