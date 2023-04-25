public interface Tree{
    //If an invalid position is sent as a parameter to any method of a tree, then an IllegalArgumentException is thrown.
    
    TreeNode getRoot(); // Get the root node for the tree
    
    TreeNode getParent(TreeNode node); // Return parent node
    
    List<TreeNode> getChild(TreeNode node); // Return list of child nodes
    
    Integer numChildren(TreeNode node); // Retu
    
    Boolean isLeaf(TreeNode node); // 
    
    Boolean isRoot(TreeNode node);
    
    Integer size();
    
    Boolean isEmpty();
    
    List<Object> getDataIterator();
    
    List<Node> getTreeNodes();

}