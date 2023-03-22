public class BinaryTree {
    
    public class IlligalNodeException extends Exception{}
    
    Integer size;
    TreeNode root;
    
    public BinaryTree(Object data){
        this.root = new BinaryTreeNode(data);
    }
    
    public TreeNode root(){
        return this.root;
    }
    
    TreeNode parent(TreeNode node){
        return node.getParent();
    }
    
    List<TreeNode> child(TreeNode node){
        return node.getChildren();
    }
    
    Integer numChildren(TreeNode node){
        return node.childrenCount();
    }
    
    Boolean isInternal(TreeNode node){
        BinaryTreeNode tmp = (BinaryTreeNode) node;
        return tmp.isInternalChild();
    }
    
    Boolean isExternal(TreeNode node){
        return isInternal(node);
    }
    
    Boolean isRoot(TreeNode node){
        return node.isRoot();
    }
    
    Integer size(){
        return this.size();
    }
    
    Boolean isEmpty(){
        return this.size == 0;
    }
    
    List<Object> iterator(){
        return null;
    }
    
    List<TreeNode> positions(){
        return null;
    }
    
    public TreeNode left(TreeNode node){
        BinaryTreeNode tmp = (BinaryTreeNode) node;
        return tmp.left();
    }
    
    public TreeNode right(TreeNode node){
        BinaryTreeNode tmp = (BinaryTreeNode) node;
        return tmp.right();
    }
    
    public TreeNode sibling(TreeNode node){
        BinaryTreeNode parent = (BinaryTreeNode) node.getParent();
        if(parent == null) return null;
        if(parent.left() == node) return parent.right();
        return parent.left();
    }
    
    public TreeNode addRoot(TreeNode node){
        //if(!isEmpty())  Throw new error
        this.root = node;
        return root();        
    }
    
    public TreeNode addLeft(BinaryTreeNode parentNode, Object data){
        //if(parentNode.left()) throw new error
        return null;
        
    }
    
    public Object setData(TreeNode node, Object data){
        Object tmp = node.getData();
        node.setData(data);
        return null;
    }
    
    // -- Helper methods --//
    private Boolean isValidNode(TreeNode node){
        //if(!(node instanceof BinaryTreeNode)) throw new IlligalNodeException('Not valid Node type.');
        return null;
    }
    
    
    // -- Node Subclass -- //
    private class BinaryTreeNode implements TreeNode{
        Object data;
        TreeNode parent;
        TreeNode left;
        TreeNode right;
        
        public BinaryTreeNode(){
            this(null);
        }
        
        public BinaryTreeNode(Object data){
            this.data = data; 
        }
        
        public void setData(Object data){
            this.data = data;
        }
        
        public Object getData(){
            return this.data;
        }
        
        public Boolean isRoot(){
        return parent == null;
        }
        
        public Boolean isInternalChild(){
            Boolean tmp = isRoot() || isLeaf();
            return !tmp;
        }
        
        public Boolean isLeaf(){
            return childrenCount() == 0;
        }
        
        public TreeNode getParent(){
            return this.parent;
        }
    
        public List<TreeNode> getChildren(){
            List<TreeNode> childs = new List<TreeNode>();
            if(this.left != null) childs.add(this.left);
            if(this.right != null) childs.add(this.right);
            return childs;
        }
        
        public Integer childrenCount(){
            Integer countOfChilds = 0;
            if(this.left != null) countOfChilds++;
            if(this.right != null) countOfChilds++;
            return countOfChilds;
        }
        
        public TreeNode left(){
            return this.left;
        }
        
        public TreeNode right(){
            return this.right;
        }
        
        public void setLeft(TreeNode node){
        }
        
        public void setRigth(TreeNode node){
        }
        
        public void setParent(TreeNode node){
            
        }
    }

}