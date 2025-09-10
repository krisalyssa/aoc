(ns day-11-test
  (:require
   [clojure.test :refer :all]
   [day-11 :refer :all]))

(deftest day-11-test
  (testing "sample data"
    (is (= 0 (part1 "../data/11-sample.txt")))
    (is (= 0 (part2 "../data/11-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/11.txt")))
    (is (= 0 (part2 "../data/11.txt")))))
