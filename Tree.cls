public interface Tree{
    //If an invalid position is sent as a parameter to any method of a tree, then an IllegalArgumentException is thrown.
    
    Position root();
    
    Position parent(Position node);
    
    List<Position> child(Position node);
    
    Integer numChildren(Position node);
    
    Boolean isInternal(Position node);
    
    Boolean isExternal(Position node);
    
    Boolean isRoot(Position node);
    
    Integer size();
    
    Boolean isEmpty();
    
    List<Object> iterator();
    
    List<Position> positions();

}