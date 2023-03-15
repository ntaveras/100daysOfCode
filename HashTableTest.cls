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
    }
    
    @isTest public static void testGetWithMultipleEntryOneSameKey(){
        HashTable obj = new HashTable();
        obj.put('one', 1);
        obj.put('one', 2);
        System.assertEquals(2, obj.get('one'));
    }
    
    @isTest public static void testGetNullValue(){
        HashTable obj = new HashTable();
        obj.put('one', null);
        System.assertEquals(null, obj.get('one'));
    }
    
    @isTest public static void testContainsKeyOnEmptyMap(){
        HashTable obj = new HashTable();
        System.assertEquals(false, obj.containsKey('one'));
    }
    
    @isTest public static void testContainsKeyOnMap(){
        HashTable obj = new HashTable();
        obj.put('one', null);
        System.assertEquals(true, obj.containsKey('one'));
    }
    
    @isTest public static void testKeySet(){
        List<String> testArray = new List<String>();
        testArray.add('one');
        testArray.add('two');
        testArray.add('three');
        testArray.add('four');
        
        HashTable obj = new HashTable();
        obj.put('one', null);
        obj.put('two', null);
        obj.put('three', null);
        obj.put('four', null);
        
        System.assertEquals(testArray.size(), obj.keySet().size());
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
        
        System.assertEquals(testArray.size(), obj.keySet().size());
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
        System.assertEquals(4, obj.remove('four'));
        System.assertEquals(3, obj.size());
    }

}