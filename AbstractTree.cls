public abstract class AbstractTree implements Tree{
    private Position root;
    private integer size;
    
    AbstractTree(){
        this.root = null;
        this.size = 0;
    }
    
    AbstractTree(Position p){
        this.root = p;
        this.size = 1;
    }
    
    // Accessor methods
    
    public Position getRoot(){
        return this.root;
    }
    
    public boolean isInternal(Position p){
        return numChildren(p) > 0;
    }
    
    public Boolean isExternal(Position p){
        return numChildren(p) == 0;
    }
    
    
    
    public Boolean isRoot(Position p){
        return p == getRoot();
    }
    
    public Boolean isEmpty(){
        return size() == 0;
    }
    
    public Integer depth(Position p){
        Integer counter = 0;
        while(!isRoot(p))
        {
            counter++;
        }
        return counter;
    }
    
    public Integer height(Position p){
        Integer h=0;
        for(Position c : getChild(p)){
            h = Math.max(h, height(c));
        }
        return h;
    }
    
    public integer numChildren(Position p){
        return 0;
    }
    
    public List<Position> getChild(Position p){
        return null;
        
    }
    
    public integer size(){
        return this.size();
    }
    
    public position getParent(Position p){
        return null;
    }
    
    public List<Position> getTreeNodes(){ // Returns an iterator for all elements in the tree
        return null;
    }

    public List<Object> getDataIterator(){ // Returns an iterator for all elements in the tree
            return null;
        }    

}