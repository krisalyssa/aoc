(ns day-16-test
  (:require
   [clojure.test :refer :all]
   [day-16 :refer :all]))

(deftest day-16-test
  (testing "sample data"
    (is (= 0 (part1 "../data/16-sample.txt")))
    (is (= 0 (part2 "../data/16-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/16.txt")))
    (is (= 0 (part2 "../data/16.txt")))))
