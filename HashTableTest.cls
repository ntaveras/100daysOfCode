@isTest(SeeAllData=false)
public class HashTableTest {
    
    @isTest public static void testSizeNoData(){
        HashTable obj = new HashTable();
        System.assertEquals(0, obj.size(), 'The Map size was '+ obj.size() + 'Instead of expected 0.');
    }
    
    @isTest public static void testIsEmptyWhenEmpty(){
        HashTable obj = new HashTable();
        System.assertEquals(true, obj.isEmpty());
    }
    
    @isTest Public static void testSizeWithData(){
        HashTable obj = new HashTable();
        obj.put('one', 1);
        obj.put('two', 2);
        System.assertEquals(2, obj.size(), 'The Map size is ' + obj.size() + 'instead of the expected value of 2.');
    }
    
    @isTest public static void testIsEmptyWhenNotEmpty(){
        HashTable obj = new HashTable();
        obj.put('one', 1);
        obj.put('two', 2);
        System.assertEquals(false, obj.isEmpty(), 'The Map returned '+ obj.isEmpty() + 'Instead of false.');
    }
    
    @isTest public static void testGetWithNoDate(){
        HashTable obj = new HashTable();
        System.assertEquals(null, obj.get('one'));
    }
    
    @isTest public static void testGetWithSingleEntry(){
        HashTable obj = new HashTable();
        obj.put('one', 1);
        System.assertEquals(1, obj.get('one'));
    }
    
    @isTest public static void testGetWithMultipleEntry(){
        HashTable obj = new HashTable();
        obj.put('one', 1);
        obj.put('two', 2);
        System.assertEquals(2, obj.get('two'));
        System.assertEquals(1, obj.get('one'));
    }
    
    @isTest public static void testGetWithMultipleEntryOneSameKey(){
        HashTable obj = new HashTable();
        Test.startTest();
        obj.put('one', 1);
        obj.put('one', 2);
        Test.stopTest();
        System.assertEquals(2, obj.get('one'));
    }
    
    @isTest public static void testGetNullValue(){
        HashTable obj = new HashTable();
        obj.put('one', null);
        System.assertEquals(null, obj.get('one'));
    }
    
    @isTest public static void testContainsKeyOnEmptyMap(){
        HashTable obj = new HashTable();
        test.startTest();
        Boolean foundKey = obj.containsKey('one');
        Test.stopTest();
        System.assert(!foundKey);
    }
    
    @isTest public static void testContainsKeyOnMap(){
        HashTable obj = new HashTable();
        obj.put('one', null);
        Test.startTest();
        Boolean keyFound = obj.containsKey('one');
        Boolean keyNotFound = obj.containsKey('two');
        Test.stopTest();
        System.assert(keyFound);
        System.assert(!keyNotFound);
    }
    
    @isTest public static void testKeySet(){
        List<String> testArray = new List<String>{'one', 'two', 'three', 'four'};
            
        HashTable obj = new HashTable();
        for(String key : testArray){
            obj.put(key, null);
        }        
        Test.startTest();
        List<String> keySet = obj.keySet();
        Test.stopTest();
        System.assertEquals(testArray.size(), keySet.size());
    }
    
    @isTest public static void testValues(){
        List<Integer> testArray = new List<Integer>();
        testArray.add(1);
        testArray.add(2);
        testArray.add(3);
        testArray.add(4);
        
        HashTable obj = new HashTable();
        obj.put('one', 1);
        obj.put('two', 2);
        obj.put('three', 3);
        obj.put('four', 4);
        Test.startTest();
        List<Object> values = obj.values();
        Test.stopTest();
        
        System.assertEquals(testArray.size(), values.size());
    }
    
    @isTest public static void testRemoveOnEmptyMap(){
        HashTable obj = new HashTable();
        System.Assert.isNull(obj.remove('one'));
    }
    
    @isTest public static void testRemove(){
        HashTable obj = new HashTable();
        obj.put('one', 1);
        obj.put('two', 2);
        obj.put('three', 3);
        obj.put('four', 4);
        Test.startTest();
        Object data = obj.remove('four');
        Test.stopTest();
        System.assertEquals(4, data);
        System.assertEquals(3, obj.size());
    }

}