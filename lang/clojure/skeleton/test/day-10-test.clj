(ns day-10-test
  (:require
   [clojure.test :refer :all]
   [day-10 :refer :all]))

(deftest day-10-test
  (testing "sample data"
    (is (= 0 (part1 "../data/10-sample.txt")))
    (is (= 0 (part2 "../data/10-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/10.txt")))
    (is (= 0 (part2 "../data/10.txt")))))
