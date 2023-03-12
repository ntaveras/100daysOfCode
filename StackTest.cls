@isTest(seeAllData=false)
public class StackTest {
    
    @isTest public static void testEmptyStackOnEmptyStack(){
        Stack s = new Stack();
        System.assertEquals(s.isEmpty(), true, 'The "testEmptyStackOnEmptyStack" test returned '+s.isEmpty()+' instead of true.');
    }
    
    @isTest public static void testEmptyStackOnPopulatedStack(){
        Stack s = new Stack();
        s.push(1);
        System.assertEquals(s.isEmpty(), false, 'The "testEmptyStackOnEmptyStack" test returned '+s.isEmpty()+' instead of false.');
    }
    
    @isTest public static void testAddingValue(){
        Stack s = new Stack();
        s.push(1);
        System.assertEquals(s.peek(), 1, 'The "testAddingValue" test returned '+s.peek()+' instead of 1.');
    }
    
    @isTest public static void testPoppingEmptyStack(){
        Stack s = new Stack();
        Integer tmp = (Integer) s.pop();
        System.assertEquals(tmp, null, 'The "testEmptyStack" test returned '+tmp+' instead of null.');
    }
    
    @isTest public static void testPoppingValidStack(){
        Stack s = new Stack();
        s.push(1);
        Integer tmp = (Integer) s.pop();
        System.assertEquals(tmp, 1, 'The "testEmptyStack" test returned '+tmp+' instead of 1.');
    }
    
    @isTest public static void testStackSize(){
        Stack s = new Stack();
        s.push(1);
        s.push(2);
        s.push(3);
        System.assertEquals(s.size(), 3, 'The "testEmptyStack" test returned '+s.size()+' instead of 3.');
    }

}