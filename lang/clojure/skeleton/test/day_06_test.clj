(ns day-06-test
  (:require
   [clojure.test :refer :all]
   [day-06 :refer :all]))

(deftest day-06-test
  (testing "sample data"
    (is (= 0 (part1 "../data/06-sample.txt")))
    (is (= 0 (part2 "../data/06-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/06.txt")))
    (is (= 0 (part2 "../data/06.txt")))))
