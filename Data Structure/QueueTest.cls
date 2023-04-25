@isTest(seeAllData=false)
public class QueueTest {
    
    @isTest static void testEmptyQueue(){
        Queue q = new Queue();
        Test.startTest();
        Boolean isQueueEmpty = q.isEmpty();
        Test.stopTest();
        system.assert(isQueueEmpty);
    }
    
    @isTest static void testNonEmptyQueue(){
        Queue q = new Queue();
        q.enqueue(1);
        Test.startTest();
        Boolean isQueueEmpty = q.isEmpty();
        Test.stopTest();
        system.assert(!isQueueEmpty);
    }
    
    @isTest static void testEnqueue(){
        Queue q = new Queue();
        Test.startTest();
        q.enqueue(1);
        Test.stopTest();
        system.assertEquals(false, q.isEmpty());
        system.assertEquals(1, q.size());
        system.assertEquals(1, (Integer) q.first());
    }
    
    @isTest static void testDequeue(){
        Queue q = new Queue();
        q.enqueue(1);
        Test.startTest();
        Integer testValue = (Integer) q.dequeue();
        Test.stopTest();
        system.assert(q.isEmpty());
        system.assertEquals(0, q.size());
        system.assertEquals(1, testValue);
    }
    
    @isTest static void testDequeueEmptyList(){
        Queue q = new Queue();
        Boolean exceptionThrown = false;
        Test.startTest();
        try{
            q.dequeue();
        }catch(Exception e){
            exceptionThrown = true;
        }
        Test.stopTest();
        system.assert(q.isEmpty());
        system.assertEquals(0, q.size());
        system.assert(exceptionThrown);
    }
    
    @isTest static void testSize(){
        Queue q = new Queue();
        for(Integer i=0; i < 5; i++)
        {
            q.enqueue(i);
        }
        Test.startTest();
        Integer queueSize = q.size();
        Test.stopTest();
        system.assertEquals(5, queueSize);
    }

}