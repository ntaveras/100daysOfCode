@isTest(seeAllData=false)
public class DoubleLinkListTest {
    
    @isTest static void testIsEmpty(){
        DoubleLinkList obj = new DoubleLinkList();
        System.Assert(obj.isEmpty);
    }
    
    @isTest static void testAddHead(){
        DoubleLinkList obj = new DoubleLinkList();
        Test.startTest();
        obj.addFirst('Test Head Data');
        Test.stopTest();
        System.assertEquals(1, obj.size);
    }
    
    @isTest static void testAddTail(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addFirst('Test Head Data');
        Test.startTest();
        obj.addLast('Test Tail Data');
        Test.stopTest();
        System.assertEquals(2, obj.size); 
    }
    
    @isTest static void testAdd(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addFirst('Test Head Data');
        obj.addLast('Test Tail Data');
        obj.add(1, 'Test Middle Data');
        System.assertEquals('Test Middle Data', obj.traverseList(1).data); 
    }
    
    @isTest static void addLastEmptyList(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addLast('Test Tail Data');
        List<Object> tmp = obj.listData();
        Integer tailIndex= obj.size - 1;
        System.assertEquals('Test Tail Data', tmp[tailIndex]);
    }
    
    @isTest static void testAddAt(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addFirst('index 0');
        obj.add(1, 'index 1');
        obj.add(2, 'index 2');
        List<Object> listData = obj.listData();
        System.debug(listData);
        System.assertEquals('index 1', listData[1]);
    }
    
    @isTest static void testAddAtOutofBoundsIndex(){
        DoubleLinkList obj = new DoubleLinkList();
        Boolean threwException = false;
        Test.startTest();        
        try{
            Integer position = obj.size + 2;
            obj.add(obj.size + 2, 'Test Data inserted at Position ' + position);
        } catch(Exception e){
            threwException = true;
        }
        Test.stopTest();
        System.assert(threwException);
    }
    
    @isTest static void testPeekisString(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addFirst('Test Head Data');
    }
    
    @isTest static void testDeleteNode(){
        DoubleLinkList obj = new DoubleLinkList();
        for(Integer i = 0; i < 3; i++)
        {
            obj.addFirst('Value ' + i);
        }
        Test.startTest();
        DoubleLinkList.Node targetNode = obj.traverseList(1);
        DoubleLinkList.Node deletedNode = obj.deleteNode(targetNode);
        Test.stopTest();
        System.assertEquals(2, obj.size);
        System.assertEquals('Value 1', (String) deletedNode.data);
    }
    
    @isTest static void testTraverseEmptyList(){
        DoubleLinkList obj = new DoubleLinkList();
        Boolean exceptionThrown = false;
        String exceptionMessage = '';
        test.startTest();
        try{
            Integer position = 0;
            obj.traverseList(position);
        }catch(Exception e){
            exceptionThrown = true;
            exceptionMessage = e.getMessage();
        }
        Test.stopTest();
        system.assert(exceptionThrown);
        system.assertEquals('The List is empty.', exceptionMessage);
    }
    
    @isTest static void testPustToHead(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addFirst('New First');
        Test.startTest();
        obj.add(0, 'The secon insert is now the First value in the list.');
        Test.stopTest();
        system.assertEquals(obj.traverseList(0).data, 'The secon insert is now the First value in the list.');
    }
    
    @isTest static void testDeletingNode(){
        DoubleLinkList obj = new DoubleLinkList();
        for(Integer i = 0; i < 5; i++)
        {
            obj.addFirst('Value ' + i); // Head ->'Value 4'->'Value 3'->'Value 2'->'Value 1'->'Value 0'-> Tail
        }
        Test.startTest();
        obj.deleteFirst(); // Head ->'Value 3'->'Value 2'->'Value 1'->'Value 0'-> Tail
        obj.deleteLast(); // Head ->'Value 3'->'Value 2'->'Value 1'-> Tail
        obj.deleteAt(1); // Head ->'Value 3'->'Value 1'-> Tail
        Test.stopTest();
        system.assertEquals('Value 3', obj.traverseList(0).data); 
    }
    
    @isTest static void testHasPrevInNodeClass(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addFirst(0);
        obj.addLast(1);
       system.assert(obj.traverseList(obj.size-1).hasPrev);
    }
    
    @isTest static void testCanModifyNodeData(){
        DoubleLinkList obj = new DoubleLinkList();
        obj.addFirst('A');
        obj.traverseList(0).setData('B');
        system.assertEquals('B', obj.traverseList(0).data);
    }
}