public class BinaryTree extends AbstractBinaryTree{
    
    public class IlligalNodeException extends Exception{}
    
    public BinaryTree(){
        root = null;
        size = 0;
    }
    
    public BinaryTree(TreeNode node){
        root = node;
        size = 1;
    }
    
    public TreeNode addRoot(TreeNode node){
        root = node;
        return node;
    }
    
    public BinaryTreeNode addLeft(TreeNode node, Object data){
        BinaryTreeNode tmp = validateNode(node);
        if(tmp.hasRight()) throw new IlligalNodeException('Left node is already assigned for the provided node.');
        BinaryTreeNode newLeftNode = new BinaryTreeNode(data);
        tmp.setLeft(newLeftNode);
        return tmp;
    }
    
    public BinaryTreeNode addRight(TreeNode node, Object data){
        BinaryTreeNode tmp = validateNode(node);
        if(tmp.hasRight()) throw new IlligalNodeException('Right node is already assigned for the provided node.');
        BinaryTreeNode newLeftNode = new BinaryTreeNode(data);
        tmp.setRigth(newLeftNode);
        return tmp;
    }
    
    public BinaryTreeNode set(TreeNode node, Object data){
        BinaryTreeNode tmp = validateNode(node);
        tmp.setData(data);
        return tmp;
    }
    
    public BinaryTreeNode remove(TreeNode node){
        BinaryTreeNode tmp = validateNode(node);
        if(tmp.childrenCount() != 1) throw new IlligalNodeException('The node should have only one child.');
        if(tmp.hasLeft()) return (BinaryTreeNode) tmp.left();
        return (BinaryTreeNode) tmp.right();
    }
    
    // -- Helper methods --//
    private BinaryTreeNode validateNode(Node node){
        if(!(node instanceof BinaryTreeNode)) throw new IlligalNodeException('Not valid Node type.');
        return (BinaryTreeNode) node;
    }
    
    
    // -- Node Subclass -- //
    private class BinaryTreeNode implements TreeNode{
        private Object data;
        private TreeNode parent;
        private TreeNode left;
        private TreeNode right;
        
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
            this.left = node;
        }
        
        public void setRigth(TreeNode node){
            this.right = node;
        }
        
        public void setParent(TreeNode node){
            this.parent = node;
        }
        
        public Boolean hasLeft(){
            return !(this.left == null);
        }
        
        public Boolean hasRight(){
            return !(this.right == null);
        }
    }

}