(ns day-06-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-06 :refer [part1 part2]]))

(deftest day-06-test
  (testing "sample data"
    (is (= 0 (part1 "../data/06-sample.txt")))
    (is (= 0 (part2 "../data/06-sample.txt")))))
