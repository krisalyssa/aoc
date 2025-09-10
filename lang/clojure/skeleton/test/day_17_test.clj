(ns day-17-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-17 :refer [part1 part2]]))

(deftest day-17-test
  (testing "sample data"
    (is (= 0 (part1 "../data/17-sample.txt")))
    (is (= 0 (part2 "../data/17-sample.txt")))))
