(ns day-12-test
  (:require
   [clojure.test :refer :all]
   [day-12 :refer :all]))

(deftest day-12-test
  (testing "sample data"
    (is (= 0 (part1 "../data/12-sample.txt")))
    (is (= 0 (part2 "../data/12-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/12.txt")))
    (is (= 0 (part2 "../data/12.txt")))))
