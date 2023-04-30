@isTest(seeAllData=false)
public class BinaryTreeTest {
    
    @isTest public static void testAddRootEmptyTree(){
        BinaryTree bt = new BinaryTree();
        BinaryTreeNode newNode = BinaryTreeNode.newNode('Root node');
        Test.startTest();
        bt.addRoot(newNode);
        Test.stopTest();
        system.assert(bt.hasRoot());
    }
    
    @isTest public static void testSizeOnEmptyTree(){
        BinaryTree bt = new BinaryTree();
        Test.startTest();
        Integer treeSize = bt.size();
        Test.stopTest();
        system.assertEquals(0, treeSize);
    }
    
    @isTest public static void testSizeOnPopulatedTree(){
        BinaryTreeNode newNode = BinaryTreeNode.newNode('a');
        BinaryTree bt = new BinaryTree(newNode); 
        
        Test.startTest();
        Integer treeSize = bt.size();
        Test.stopTest();
        system.assertEquals(1, treeSize);
    }
    
    @isTest public static void testIsEmpty(){
        BinaryTree bt = new BinaryTree();
        Test.startTest();
        Boolean isEmpty = bt.isEmpty();
        Test.stopTest();
        system.assert(isEmpty);
    }
    
    @isTest public static void testHasRootOnEmptyTree(){
        BinaryTree bt = new BinaryTree();
        Test.startTest();
        Boolean hasRoot = bt.hasRoot();
        Test.stopTest();
        system.assert(!hasRoot);
    }
    
    @isTest public static void testHasRootOnPopulatedTree(){
        BinaryTree bt = new BinaryTree();
        BinaryTreeNode newNode = BinaryTreeNode.newNode('Root node');
        bt.addRoot(newNode);
        Test.startTest();        
        Boolean hasRoot = bt.hasRoot();
        Test.stopTest();
        system.assert(hasRoot);
    }
    
    @isTest public static void testSetLeft(){        
        BinaryTree bt = new BinaryTree(BinaryTreeNode.newNode('a'));
        BinaryTreeNode newNode = (BinaryTreeNode) bt.getRoot();
        bt.addLeft(newNode, 'b');
        bt.addRight(newNode, 'c');
        bt.addLeft(newNode.getLeft(), 'd');
        bt.addRight(newNode.getLeft(), 'e');
        bt.addRight(newNode.getRight(), 'e');
        Test.startTest();
        List<String> tmp = (List<String>) bt.bredthFirstValues();
        Test.stopTest();
        System.assertEquals(new List<String>{'a','b','d','e','c','f'}, tmp);
    }

}