(ns day-14-test
  (:require
   [clojure.test :refer :all]
   [day-14 :refer :all]))

(deftest day-14-test
  (testing "sample data"
    (is (= 0 (part1 "../data/14-sample.txt")))
    (is (= 0 (part2 "../data/14-sample.txt"))))
  (testing "puzzle data"
    (is (= 0 (part1 "../data/14.txt")))
    (is (= 0 (part2 "../data/14.txt")))))
