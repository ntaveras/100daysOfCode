@isTest
public class BinarySearchTest {
    
    //Nothing to search in an empty array. Return -1 (not found)
    @isTest public static void testEmptyArray(){
        BinarySearch bs = new BinarySearch();
        List<Integer> numsArray = new List<Integer>();
        Integer target = 9;
        Test.startTest();
        Integer tmp = bs.doSearch(numsArray, target);
        Test.stopTest();
        System.assertEquals(-1, tmp, 'The "testEmptyArray" method returned '+tmp+' on empty array. Method should return -1.'); 
    }
    
    //Test happy path. Return index of value found in end of sorted array.
    @isTest public static void testSearchOnValidArrayEnd(){ 
        BinarySearch bs = new BinarySearch();
        List<Integer> nums = new List<Integer>{-1, 2, 7, 9};
        Integer target = 9;
        Test.startTest();
        Integer tmp = bs.doSearch(nums, target);
        Test.stopTest();
        System.assertEquals(3, tmp, 'The method returned '+tmp+'. Was expecting 3.');
    }
    
    //Test happy path. Return index of value found in middle of sorted array.
    @isTest public static void testSearchOnValidArrayMiddle(){ 
        BinarySearch bs = new BinarySearch();
        List<Integer> nums = new List<Integer>{-1, 2, 7, 9, 11};
        Integer target = 7;
        Test.startTest();
        Integer tmp = bs.doSearch(nums, target);
        Test.stopTest();
        System.assertEquals(2, tmp, 'The method returned '+tmp+'. Was expecting 2.');
    }
    
    //Test happy path. Return index of value found in begining of sorted array.
    @isTest public static void testSearchOnValidArrayBegining(){ 
        BinarySearch bs = new BinarySearch();
        List<Integer> nums = new List<Integer>{-1, 2, 7, 9, 11};
        Integer target = -1;
        Test.startTest();
        Integer tmp = bs.doSearch(nums, target);
        Test.stopTest();
        System.assertEquals(0, tmp, 'The method returned '+tmp+'. Was expecting 0.');
    }
    
    @isTest public static void testSearchOnValidArrayAnywhere(){
        BinarySearch bs = new BinarySearch();
        List<Integer> nums = new List<Integer>();
        integer target = (Math.random() * 100).intValue();
        for(Integer i = 0; i < 100; i++){
            nums.add(i);
        }
        test.startTest();
        Integer tmp = bs.doSearch(nums, target);
        Test.stopTest();
        System.assertEquals(target, nums[tmp]);
    }
    
    //Test negative case of above happy path. Return -1; can't find value on non-sorted array.
    @isTest public static void testSearchOnUnorderedArray(){ 
        BinarySearch bs = new BinarySearch();
        List<Integer> nums = new List<Integer>{-1, 2, 9, 5, 7, 8, 11};
        Integer target = 9;
        Test.startTest();
        Integer tmp = bs.doSearch(nums, target);
        Test.stopTest();
        System.assertEquals(-1, tmp, 'The method returned '+tmp+'. Was expecting -1.');
    }
    
    //return -1. Value does not exist in array
    @isTest public static void testSearchNonExistinValue(){ 
        BinarySearch bs = new BinarySearch();
        List<Integer> nums = new List<Integer>{-1, 2, 7, 8, 11};
        Integer target = 9;
        Test.startTest();
        Integer tmp = bs.doSearch(nums, target);
        Test.stopTest();
        System.assertEquals(-1, tmp, 'The method returned '+tmp+'. Was expecting -1.');
    }

}