(ns day-15-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-15 :refer [part1 part2]]))

(deftest day-15-test
  (testing "sample data"
    (is (= 0 (part1 "../data/15-sample.txt")))
    (is (= 0 (part2 "../data/15-sample.txt")))))
