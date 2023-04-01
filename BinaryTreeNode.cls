public class BinaryTreeNode implements TreeNode{
    private Object data;
    private TreeNode left;
    private TreeNode right;
    private TreeNode parent;
    
    public BinaryTreeNode(){
        this(null);
    }
    
    public BinaryTreeNode(Object data){
        this.data = data; 
    }
    
    // -- Getter methods -- //
    public Object getData(){
        return this.data;
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
    
    public BinaryTreeNode getLeft(){
        return (BinaryTreeNode) this.left;
    }
    
    public BinaryTreeNode getRight(){
        return (BinaryTreeNode) this.right;
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
    
    public Boolean hasLeft(){
        return !(this.left == null);
    }
    
    public Boolean hasRight(){
        return !(this.right == null);
    }
    
    
    // -- Mutator methods -- //
    public void setData(Object data){
        this.data = data;
    }
    
    public void setParent(TreeNode node){
        this.parent = node;
    }
    
    public void setLeft(TreeNode node){
    }
    
    public void setRigth(TreeNode node){
    }
    
    
    // -- Helper methods -- //
    public Integer childrenCount(){
        Integer countOfChilds = 0;
        if(this.left != null) countOfChilds++;
        if(this.right != null) countOfChilds++;
        return countOfChilds;
    }
    
    
    // -- Factory methods -- //
    public static BinaryTreeNode newNode(){
        BinaryTreeNode tmp = new BinaryTreeNode();
        return tmp;
    }
    
    public static BinaryTreeNode newNode(Object data){
        BinaryTreeNode tmp = new BinaryTreeNode(data);
        return tmp;
    }
}