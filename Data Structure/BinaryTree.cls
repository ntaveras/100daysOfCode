public class BinaryTree extends AbstractBinaryTree{
    
    //public class IlligalNodeException extends Exception{}
    
    public BinaryTree(){
        root = null;
        size = 0;
    }
    
    public BinaryTree(TreeNode node){
        root = node;
        size = 1;
    }
    
    // -- Mutator methods -- //
    public TreeNode addRoot(TreeNode node){
        if(root != null) throw new BinaryTreeException('Tree already has a Root.');
        root = node;
        this.size++;
        return node;
    }
    
    public BinaryTreeNode remove(TreeNode node){
        BinaryTreeNode tmp = validateNode(node);
        if(tmp.childrenCount() != 1) throw new BinaryTreeException('The node should have only one child.');
        this.size--;
        if(tmp.hasLeft()) return (BinaryTreeNode) tmp.getLeft();
        return (BinaryTreeNode) tmp.getRight();
    }
    
    
    // -- Setter methods -- //
    public BinaryTreeNode addLeft(BinaryTreeNode node, Object data){
        if(hasLeft(node)) throw new BinaryTreeException('Left branch is already assigned for the provided node.');
        BinaryTreeNode newLeftNode = new BinaryTreeNode(data);
        node.setLeft(newLeftNode);
        this.size++;
        return node;
    }
    
    public BinaryTreeNode addRight(BinaryTreeNode node, Object data){
        BinaryTreeNode tmp = validateNode(node);
        if(tmp.hasRight()) throw new BinaryTreeException('Right node is already assigned for the provided node.');
        BinaryTreeNode newLeftNode = new BinaryTreeNode(data);
        tmp.setRigth(newLeftNode);
        this.size++;
        return tmp;
    }
    
    public BinaryTreeNode setData(TreeNode node, Object data){
        BinaryTreeNode tmp = validateNode(node);
        tmp.setData(data);
        return tmp;
    }
    
    // Helper methods -- //
    public List<Object> depthFirstValues(){
        List<Object> result = new List<Object>();
        if(getRoot() == null) return result;
        Stack stack = new Stack();
        stack.push(getRoot());
        while(!stack.isEmpty())
        {
            BinaryTreeNode currentNode = (BinaryTreeNode) stack.pop();
            if(hasRight(currentNode)) stack.push(getRight(currentNode));
            if(hasLeft(currentNode)) stack.push(getLeft(currentNode));
        }
        return result;
    }
    
    public List<Object> bredthFirstValues(){
        List<Object> result = new List<Object>();
        Queue queue = new Queue();
        if(getRoot() == null) return result;
        queue.enqueue(getRoot());  
        while(!queue.isEmpty())
        {
            BinaryTreeNode currentNode = (BinaryTreeNode) queue.dequeue();
            queue.enqueue(currentNode.getChildren());
            result.add(currentNode.getData());
        }
        return result;
    }
    
    private BinaryTreeNode validateNode(Node node){
        if(!(node instanceof BinaryTreeNode)) throw new BinaryTreeException('Not valid Node type.');
        return (BinaryTreeNode) node;
    }
}