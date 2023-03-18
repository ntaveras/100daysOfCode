public class BinaryTreeNode implements Position{
    private Object data;
    private Position left;
    private Position right;
    private Position parent;
    
    public Object getElement(){
        return this.data;
    }
    
    public Position getLeftNode(){
        return (BinaryTreeNode) this.left;
    }
    
    public Position getRightNode(){
        return (BinaryTreeNode) this.right;
    }

}