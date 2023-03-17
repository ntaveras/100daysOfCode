public abstract class AbstractTree implements Tree{
    
    public boolean isInternal(Position p){
        return numChildren(p) > 0;
    }
    
    public Boolean isExternal(Position p){
        return numChildren == 0;
    }
    
    public Boolean isRoot(Position p){
        return p == root();
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
        for(Position c : children(p)){
            h = Math.max(h, height(c));
        }
        return h;
    }

}