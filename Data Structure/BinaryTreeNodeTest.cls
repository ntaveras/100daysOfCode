@isTest(SeeAllData=false)
public class BinaryTreeNodeTest {
    
    @isTest public static void testGetDataFromEmptyNode(){
        BinaryTreeNode node = new BinaryTreeNode();
        Test.startTest();
        Object data = node.getData();
        Test.stopTest();
        System.assertEquals(Null, data);     
    }
    
    @isTest public static void testGetDataFromPopulatedNode(){
        BinaryTreeNode node = new BinaryTreeNode(1);
        Test.startTest();
        Integer data = (Integer) node.getData();
        Test.stopTest();
        System.assertEquals(1, data);   
    }
    
    @isTest public static void testSetData(){
        BinaryTreeNode node = new BinaryTreeNode();
        Test.startTest();
        node.setData('data');
        Test.stopTest();
        System.assertEquals('data', node.getData());
    }
    
    @isTest public static void testGetParent(){
        BinaryTreeNode parent = new BinaryTreeNode();
        BinaryTreeNode child = new BinaryTreeNode();
    }
    
    @isTest public static void testSetParent(){
        BinaryTreeNode parent = new BinaryTreeNode();
        BinaryTreeNode child = new BinaryTreeNode();
        Test.startTest();
        System.debug('Left: ' + parent.hasLeft() + ' - Right: ' + parent.hasRight() + ' => Final: ' + (parent.hasLeft() && parent.hasRight()));
        child.setParent(parent);
        Test.stopTest();
        System.assert(child.getParent() == parent);
        List<BinaryTreeNode> childs = parent.getChildren();
        Boolean foundChild = false;
        Integer counter = 0;
        while(!foundChild && (counter < childs.size())){
            if(childs[counter] == child) foundChild = true;
        }
        System.assert(foundChild);
    }

}