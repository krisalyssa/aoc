(ns day-18-test
  (:require
   [clojure.test :refer :all]
   [day-18 :refer :all]))

(deftest day-18-test
  (testing "sample data"
    (is (= 0 (part1 "../data/18-sample.txt")))
    (is (= 0 (part2 "../data/18-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/18.txt")))
    (is (= 0 (part2 "../data/18.txt")))))
