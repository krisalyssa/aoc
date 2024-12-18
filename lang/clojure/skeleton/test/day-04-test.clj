(ns day-04-test
  (:require
   [clojure.test :refer :all]
   [day-04 :refer :all]))

(deftest day-04-test
  (testing "sample data"
    (is (= 0 (part1 "../data/04-sample.txt")))
    (is (= 0 (part2 "../data/04-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/04.txt")))
    (is (= 0 (part2 "../data/04.txt")))))
