public interface TreeNode extends Node{
    
    TreeNode getParent();
    
    List<TreeNode> getChildren();
    
    void setParent(TreeNode data);
    
    void setLeft(TreeNode data);
    
    void setRigth(TreeNode data);
    
    Boolean isRoot();
    
    Boolean isInternalChild();
    
    Boolean isLeaf();
    
    Integer childrenCount();    
}