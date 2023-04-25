public abstract class AbstractTree implements Tree{
    protected TreeNode root;
    protected integer size;
    
    // -- Accessor methods -- //
    public TreeNode getRoot(){
        return this.root;
    }
    
    public TreeNode getParent(TreeNode node){
        return node.getParent();
    }
    
    public List<TreeNode> getChild(TreeNode node){
        return node.getChildren();
    }
    
    public List<TreeNode> getTreeNodes(){ // Returns an iterator for all elements in the tree
        return null;
    }

    public List<Object> getDataIterator(){ // Returns an iterator for all elements in the tree
            return null;
    }
    
    public Boolean isRoot(TreeNode node){
        return node == getRoot();
    }
    
    public Boolean isInternal(TreeNode node){
        return node.childrenCount() > 0;
    }
    
    public Boolean isLeaf(TreeNode node){
        return node.childrenCount() == 0;
    }
    
    public Boolean isEmpty(){
        return size() == 0;
    }
    
    public Boolean hasRoot(){
        return this.root != null;
    }
    
    
    // -- Helper methods -- //
        public Integer depth(TreeNode p){
        Integer counter = 0;
        while(!isRoot(p))
        {
            counter++;
        }
        return counter;
    }
    
    public Integer height(TreeNode node){
        Integer treeHight = 0;
        for(TreeNode child : getChild(node)){
            treeHight = Math.max(treeHight, height(child));
        }
        return treeHight;
    }
    
    public Integer numChildren(TreeNode p){
        return p.childrenCount();
    }
    
    public Integer size(){
        return this.size;
    }
}