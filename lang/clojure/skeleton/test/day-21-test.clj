(ns day-21-test
  (:require
   [clojure.test :refer :all]
   [day-21 :refer :all]))

(deftest day-21-test
  (testing "sample data"
    (is (= 0 (part1 "../data/21-sample.txt")))
    (is (= 0 (part2 "../data/21-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/21.txt")))
    (is (= 0 (part2 "../data/21.txt")))))
