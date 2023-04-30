public interface TreeNode extends Node{
    
    TreeNode getParent();
    
    List<TreeNode> getChildren();
    
    void setParent(TreeNode data);
    
    void addChildren(TreeNode node);
    
    Boolean isRoot();
    
    Boolean isInternalChild();
    
    Boolean isLeaf();
    
    Integer childrenCount();    
}