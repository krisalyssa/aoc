(ns day-13-test
  (:require
   [clojure.test :refer :all]
   [day-13 :refer :all]))

(deftest day-13-test
  (testing "sample data"
    (is (= 0 (part1 "../data/13-sample.txt")))
    (is (= 0 (part2 "../data/13-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/13.txt")))
    (is (= 0 (part2 "../data/13.txt")))))
