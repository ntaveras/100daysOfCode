public abstract class AbstractBinaryTree extends AbstractTree{
    
    public class BinaryTreeException extends Exception{}
    
    // -- Getter methods -- //
    public BinaryTreeNode getLeft(BinaryTreeNode node){
        return (BinaryTreeNode) node.getLeft();
    }
    
    public BinaryTreeNode getRight(BinaryTreeNode node){
        return (BinaryTreeNode) node.getRight();
    }
    
    public BinaryTreeNode getSibling(BinaryTreeNode node){
        BinaryTreeNode parent = (BinaryTreeNode) node.getParent();
        if(parent.getLeft() == node) return (BinaryTreeNode) parent.getRight();
        if(parent.getRight() == node) return (BinaryTreeNode) parent.getLeft();
        return null;
    }
    
    public Boolean hasLeft(BinaryTreeNode node){
        return node.hasLeft();
    }
    
    public Boolean hasRight(BinaryTreeNode node){
        return node.hasRight();
    }
    
    
    // -- Helper methods -- //
    public List<BinaryTreeNode> depthFirstNodes(BinaryTreeNode node){
        List<BinaryTreeNode> TraversedNodes = new List<BinaryTreeNode>();
        Stack stack = new Stack();
        BinaryTreeNode currentNode = node;
        if(node.hasLeft()) stack.push(node);
        return TraversedNodes;
    }
    
}