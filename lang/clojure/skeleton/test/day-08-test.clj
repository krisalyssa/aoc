(ns day-08-test
  (:require
   [clojure.test :refer :all]
   [day-08 :refer :all]))

(deftest day-08-test
  (testing "sample data"
    (is (= 0 (part1 "../data/08-sample.txt")))
    (is (= 0 (part2 "../data/08-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/08.txt")))
    (is (= 0 (part2 "../data/08.txt")))))