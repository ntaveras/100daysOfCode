/* Author: Narayana Taveras
 * Description: 
 * 	Concreate Binary Tree Node.
 * 	Method signatures:
 * 	- getData() : Object
 *  - getParent() : TreeNode
 *  - first() : Object
 *  - size() : Integer
 *  - isEmpty() : Boolean
 * Test Class: QueueTest
 * Trigger Name: BinaryTreeNodeTest
 * Change History:
 * 
 * - 12/Mar./23 - Created
 * 
*/
public class BinaryTreeNode implements TreeNode{
    private Object data;
    private BinaryTreeNode left;
    private BinaryTreeNode right;
    private BinaryTreeNode parent;
    
    public class BinaryTreeNodeException extends Exception{}
    
    public BinaryTreeNode(){
        this(null);
    }
    
    public BinaryTreeNode(Object data){
        this.data = data; 
        this.left = null;
        this.right = null;
        this.parent = null;
    }
    
    // -- Getter methods -- //
    public Object getData(){
        return this.data;
    }
    
    public BinaryTreeNode getParent(){
        return this.parent;
    }
    
    public List<BinaryTreeNode> getChildren(){
        List<BinaryTreeNode> childs = new List<BinaryTreeNode>();
        if(hasLeft()) childs.add(this.left);
        if(hasRight()) childs.add(this.right);
        return childs;
    }
    
    public BinaryTreeNode getLeft(){
        return this.left;
    }
    
    public BinaryTreeNode getRight(){
        return this.right;
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
        return (getLeft() != null);
    }
    
    public Boolean hasRight(){
        return (getRight() != null);
    }
    
    
    // -- Mutator methods -- //
    public void setData(Object data){
        this.data = data;
    }
    
    public void setParent(TreeNode node){
        BinaryTreeNode parent = (BinaryTreeNode) node;
        parent.addChildren(this);
        this.parent = parent;
    }
    
    public void addChildren(TreeNode node){
        BinaryTreeNode tmp = (BinaryTreeNode) node;
        try{
            if(!hasLeft()) setLeft(tmp);
        	if(!hasRight()) setRigth(tmp); 
        } catch (BinaryTreeNodeException e) {
            
            System.debug(e.getMessage());
        }
    }
    
    public void setLeft(BinaryTreeNode node){
        this.left = node;
        node.setParent(this);
    }
    
    public void setRigth(BinaryTreeNode node){
        this.right = node;
        node.setParent(this);
    }
    
    // -- Helper methods -- //
    public Integer childrenCount(){
        Integer countOfChilds = 0;
        if(hasLeft()) countOfChilds++;
        if(hasRight()) countOfChilds++;
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